--- 
date: "2009-01-26T00:00:00Z"
status: publish 
categories: 
       - Programming 
tags: 
       - .NET 
title: Common Sevice Locator 
type: post 
--- 
  
One of the nice things about [Dependency Injection](http://martinfowler.com/articles/injection.html) is that it can really help write a more flexible, modular application.  These days, it seems that there is no shortage of choice in the .NET community when it comes to IoC frameworks:

- [StructureMap](http://structuremap.sourceforge.net)
- [Castle Windsor](http://www.castleproject.org/container/index.html)
- [Ninject](http://www.ninject.org)
- [Autofac](http://code.google.com/p/autofac/)
- [Unity](http://www.codeplex.com/unity)
- [Spring.NET](http://www.springframework.net/)
- And probably others that I'm missing.

Ironically, when you first start using an IoC framework, you might find that in trying to make a loosely-coupled, modular, application you end up shackling yourself to the framework you're using for IoC. For example, you start off using your own homegrown IoC framework, and then decide at some point in the future to use a different framework, like say StructureMap.  Going through your codebase to make these changes can be quite the exercise in pain. There are a couple of ways to isolate yourself from this kind of situation.  I won't get into all of them but instead will focus on the [Common Service Locator](http://www.codeplex.com/CommonServiceLocator). 

What is Common Service Locator?  Well, allow me to cut and paste some text from the web site: "*The Common Service Locator library contains a shared interface for service location which application and framework developers can reference. The library provides an abstraction over IoC containers and service locators. Using the library allows an application to indirectly access the capabilities without relying on hard references. The hope is that using this library, third-party applications and frameworks can begin to leverage IoC/Service Location without tying themselves down to a specific implementation.*" 

Blah blah blah - so what does all that mean?  Well, in my own words, CSL is basically a wrapper around your IoC container which separates how you  initialize/configure your IoC container from how you use it.  This separation allows you to use your IoC container without knowing anything about it. This separation is achieved by use of adapters for the particular IoC container that you want to use.  These adapters are what do the dirty work of finding the service you need, in their own special way and totally transparent from your application code.  Currently, the Common Service Locator has adapters for:
* [StructureMap](http://www.codeplex.com/CommonServiceLocator/Wiki/View.aspx?title=StructureMap%20Adapter&referringTitle=Home)
* [Castle Windows](http://www.codeplex.com/CommonServiceLocator/Wiki/View.aspx?title=Castle%20Windsor%20Adapter&referringTitle=Home)
* [Unity](http://www.codeplex.com/CommonServiceLocator/Wiki/View.aspx?title=Unity%20Adapter&referringTitle=Home) 
* [Spring.NET](http://www.codeplex.com/CommonServiceLocator/Wiki/View.aspx?title=Spring%20.NET%20Adapter&referringTitle=Home)
* [autofac](http://www.codeplex.com/CommonServiceLocator/Wiki/View.aspx?title=Autofac%20Adapter&referringTitle=Home). 

Now, allow me an example of using the Common Service Locator with StructureMap. There is no special reason as to why StructureMap - it just happens to be what I find myself using these days. Now, say I use the the following [registry](http://structuremap.sourceforge.net/RegistryDSL.htm) to configure StructureMap:

```csharp
public class DefaultStructureMapRegistry: Registry
{
       public DefaultStructureMapRegistry()
       {
              ForRequestedType<IDb4oConfiguration>()
                     .TheDefaultIsConcreteType<SimpleDb4oConfiguration>();
       }
}
```

In a nutshell this says that every time StructureMap is asked to provided an object of type IDb4oConfiguration, it should instantiate a SimpleDb4oConfiguration object and return that.  So, to get an instance of IDb4oConfiguration with StructureMap, I would do something like this:

```csharp
var db4oConfig = ObjectFactory.GetInstance<IDb4oConfiguration>();
```

Pretty simple, but it does kind of tightly couples me to StructureMap.  If I need/feel like/am forced at gunpoint to change my IoC container to something that is Not StructureMap, you can bet that there will be much wailing and gnashing of teeth on my part as I hunt through my code to make these changes. Now enter the Common Service Locator.  First, let's take a peek at some interfaces for CSL.  First an interface:

```csharp
namespace Microsoft.Practices.ServiceLocation
{
     public interface IServiceLocator : IServiceProvider
     {
         object GetInstance(Type serviceType);
         object GetInstance(Type serviceType, string key);
         IEnumerable<object> GetAllInstances(Type serviceType);
         TService GetInstance<TService>();
         TService GetInstance<TService>(string key);
         IEnumerable<TService> GetAllInstances<TService>();
     }
}
```

The `IServiceLocator` is an interface that your application will use when it requests something from your IoC container. Another thing that CSL provides is a static class that your application would use to use a current `IServiceLocator` to request services.  That static class looks something like:

```csharp
namespace Microsoft.Practices.ServiceLocation
{
       public static class ServiceLocator
       {
              public static IServiceLocator Current { get; }
              public static void SetLocatorProvider(ServiceLocatorProvider newProvider) {}
       }
}
```

So, now lets see how we would request the default implementation of the IDb4oConfiguration service using CSL.  First, we would initialize CSL:

```csharp
var registry = new DefaultStructureMapRegistry();
var container = new global::StructureMap.Container(registry);
var smServiceLocator = new StructureMapServiceLocator(container);
ServiceLocator.SetLocatorProvider(() => smServiceLocator );
```
What is going on here? Allow me to provide a quick line by line explanation: Line 1 we instantiate a new StructureMap registry.  We then feed that registry to a StructureMap container in line 2.  With line 3, we see that StructureMap container is then fed to the StructureMapServiceLocator, which is the SM adapter for the Common Service Locator.  Finally, with line 4 we provide a lambda that CSL will use to fulfill future requests for services. Now when our application wants to get an instance of IDb4oConfiguration it just politely asks CSL:

```csharp
var db4oConfig = ServiceLocator.Current.GetService<IDb4oConfiguration>();
```

Pretty simple and clean, [eh](http://en.wikipedia.org/wiki/Eh#Canada)?  Now, when radical group the *Foundation for Unity as the Dominate IoC Container* sneaks into your cube and forces you at the point of a nerf gun to switch to Unity, you can do so with minimal disruption to your application. With a properly layered application, it would be as simple as coding a new UnityConfiguration layer and then using that instead of your StructureMapConfiguration layer on application startup. Now, granted this is pretty trivialized example.  There are other ways to solve this problem, but CSL does seem to take are of the grunt work for you so that you can just get going with things.
