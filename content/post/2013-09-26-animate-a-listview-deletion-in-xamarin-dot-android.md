---
categories: ["Programming"]
tags: ["Xamarin", "android", "C#"]
comments: true
date: "2013-09-26T00:00:00Z"
title: Animate a ListView deletion in Xamarin.Android
---

A visually pleasant effect when deleting items from a ListView is to animate the row being deleted by gradually change the `.Alpha` value of the view from 1.0 to 0.0. If you've tried to animate the deletion of a row from a [ListView](http://developer.android.com/reference/android/widget/ListView.html) in a Xamarin.Android application, you may observe some curious behaviour when rapidly scrolling through a ListView with many rows: the animation may appear on rows other than then one that is being deleted. 

<!--more-->

This happens because the ListView will recycle views for each row - the content changes but not the view itself. The side-effect of this is that the animation is transferred along with the recycled view. What is necessary is to convince the ListView not to recycle the view in while the animation is still in progress. There are two ways to handle this in Xamarin.Android when you're targeting Android 4.2 (API level 16) or higher:

* Use a [ViewPropertyAnimator.](http://developer.android.com/reference/android/view/ViewPropertyAnimator.html)
* Use a [ValueAnimator](http://developer.android.com/reference/android/animation/ValueAnimator.html).

The ViewPropertyAnimator is, argueable the least amount of code. Take a look at the following event handler for the `ListView.ItemClick` event:

```
private void HandleItemClick(object sender, AdapterView.ItemClickEventArgs e)
{

	e.View.Animate()
		.SetDuration(1000)
		.Alpha(0)
    	.WithEndAction(new Runnable(() =>{
                _adapter.Remove(e.Id);
                e.View.Alpha = 1f;
        }));
}
```

This code is deceptively simple - animate the value of `e.View.Alpha` from 1.0 to 0.0 over the duration of one section. The `WithEndAction` is a helper method that was introduced in API 16. that specifies some action to be performed when the animation is complete. The ListView will not recycle the view while the ViewPropertyAnimator is active.

The other technique involves using a ValueAnimator, as shown in this alternate `ListView.ItemClick`:

```
private void HandleItemClick(object sender, AdapterView.ItemClickEventArgs e)
{
	View view = e.View;
	view.HasTransientState = true; 

	ValueAnimator animator = ValueAnimator.OfFloat(new[] { 1f, 0f });
	animator.SetDuration(1000);
	animator.Update += (o, animatorUpdateEventArgs) =>{
	    view.Alpha = (float)animatorUpdateEventArgs.Animation.AnimatedValue;
	};

	animator.AnimationEnd += delegate{
	    _adapter.Remove(e.Id);
	    view.Alpha = 1f;
	};
	animator.Start();

}
```

This code is a fairly straight forward [ValueAnimator](http://developer.android.com/reference/android/animation/ValueAnimator.html). What prevents the ListView from trying to recycle the view is `view.HasTransientState = true;`. The property [HasTransientState](http://developer.android.com/reference/android/support/v4/view/ViewCompat.html#setHasTransientState(android.view.View, boolean)) was introduced in JellyBean, and tells the framework that the view is tracking some transient state (i.e. the animation) and needs to be preserved.

I've put up a [sample project on GitHub](https://github.com/topgenorth/animate-listview-delete) to show this in action.
