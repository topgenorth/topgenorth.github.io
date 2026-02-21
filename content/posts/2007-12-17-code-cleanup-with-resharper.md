--- 
date: "2007-12-17T00:00:00Z" 
status: publish 
categories: 
  - Programming 
tags: 
  - .NET 
title: Code Cleanup with Resharper 
type: post 
---

As most Resharpies know, when you're using Resharper you can reformat your code. A nice feature is that you can use this reformat code to also organize and layout your code files the way you like it.

For example, [Kyle Baley did post](http://codebetter.com/blogs/kyle.baley/archive/2007/12/17/removing-regions-or-quot-how-to-keep-your-code-expanded-quot.aspx) on how to how to use the format code to get rid of regions. His techique is a bit unrefined - his revolutionary, dogmatic zeal he will clobber all regions and do nothing else - but still handy.   Myself, I'm a bit more compulsive / fussy when it comes to the layout of my code. Not only do I want regions gone, but I want the code to appear in a certain order. Lucky for me that Reformat Code does this for me. Here is the [Type Member Layout pattern I use](http://www.opgenorth.net/Data/Sites/1/Files/ResharperPatterns.xml). If you want to use it, just paste it into the type member layout window in Resharper.

What this will do, when you ask Resharper to Reformat Your Code, is the following: Remove all regions Sort your code, with the following order:

- any COM Interop interfaces
- public delegates
- public enums
- constants (sorted alphabetically)
- fields (sorted with readonly first, and alphabetically)
- static constructors
- constructors
- properties (sorted alphabetically)
- methods (sorted alphabetically)
- anything else (sorted alphabetically)

For the sake of brevity, I'm not giving a detailed breakdown of the Type Member Layout Pattern syntax. Well, brevity and the fact that I'm not 100% certain on a lot of it and don't want to unintentionally say something wrong. I do believe that the format is pretty straight forward, so you look at it and make your own adjustments.

However, to give you an example. Imagine for a moment that you wanted to surround any interface methods in a \#region. First off, don't tell Kyle. Might be a good idea [not to mention it to David Laribee](http://laribee.com/blog/2007/07/22/why-regions-are-fugly/) while you're at it. Secondly, add the following snippet:

```
<Entry>
```

```
  <Match>
```

```
    <And Weight="100">
```

```
      <Kind Is="member"/>
```

```
        <ImplementsInterface/>
```

```
    </And>
```

```
  </Match>
```

```
  <Sort>
```

```
    <ImplementsInterface Immediate="true"/>
```

```
      <Kind Order="property method"/>
```

```
      <Readonly/>
```

```
      <Name/>
```

```
  </Sort>
```

```
  <Group>
```

```
    <ImplementsInterface Immediate="true" Region="${ImplementsInterface} Members"/>
```

```
  </Group>
```

```
</Entry>
```

```
```

What this will do is, for each member of your class that is part of an interface implementation (the whole part), sort it by it's name (the part), and surround them with a \#region (). If you look at my [Resharper Patterns with Interfaces](http://www.opgenorth.net/Data/Sites/1/Files/ResharperPatternsWithInterface.xml) sample, you can see by the position with in the element that the interface \#region will appear at almost the end of your \*.CS file. I hope now that this will appease your inner obsessive compulsive self.
