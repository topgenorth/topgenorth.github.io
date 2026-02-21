--- 
date: "2011-09-06T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - android 
title: Using AutoCompleteTextView and SimpleCursorAdapter 
type: post 
---

I have a simple little pet project (for Android), and one of the things I wanted to do was to to have a text field that would show me previous values as I typed in the text box (see screenshot below). Of course, this control is already a part of the Android SDK - it's our good friend the [AutoCompleteTextView](http://developer.android.com/reference/android/widget/AutoCompleteTextView.html).

![](http://www.opgenorth.net/wp-content/uploads/2011/09/AutoCompleteTextView.png)

To populate the drop-down, I have an SQLite table called vehicle_descriptions, which looks something like the screenshot below. What I want is for a given vehicle (a value derived from another control on my Activity) to show me the value of the description column in the table.

![](http://www.opgenorth.net/wp-content/uploads/2011/09/vehicle_descriptions_table.png)

At first I started out by sub-classing [CursorAdapter](http://developer.android.com/reference/android/widget/CursorAdapter.html), but that just seemed to be a bit to heavy. What I had worked, but it seemed like there should be a simpler way to do this. [CursorAdapter](http://developer.android.com/reference/android/widget/CursorAdapter.html) is probably a better choice for more elaborate requirements (maybe displaying images or doing some calculations), but in this case it struck me as overkill - I just wanted to do a simple lookup against a table. Turns out I was right - the easy way is to just use a [SimpleCursorAdapter](http://developer.android.com/reference/android/widget/SimpleCursorAdapter.html).

```xml
        <AutoCompleteTextView android:id="@+id/description"
                              android:completionThreshold="1"
                              android:layout_height="wrap_content"
                              android:layout_width="fill_parent"
                              android:hint="Trip Description (optional)"
                              android:lines="1" />
```

To setup my control, I have created a function that I call inside onCreate() of my Activity. Here is the code, and then I will explain it in more detail:

```java        
        private void initializeDescription() {
            _descriptionText = (AutoCompleteTextView) findViewById(R.id.description);
            final int[] to = new int[]{android.R.id.text1};
            final String[] from = new String[]{VehicleDescriptionsTable.DESCRIPTION};
            SimpleCursorAdapter adapter = new SimpleCursorAdapter(this,
                    android.R.layout.simple_dropdown_item_1line,
                    null,
                    from,
                    to);

            // This will provide the labels for the choices to be displayed in the AutoCompleteTextView
            adapter.setCursorToStringConverter(new SimpleCursorAdapter.CursorToStringConverter() {
                @Override
                public CharSequence convertToString(Cursor cursor) {
                    final int colIndex = cursor.getColumnIndexOrThrow(VehicleDescriptionsTable.DESCRIPTION);
                    return cursor.getString(colIndex);
                }
            });

            // This will run a query to find the descriptions for a given vehicle.
            adapter.setFilterQueryProvider(new FilterQueryProvider() {
                @Override
                public Cursor runQuery(CharSequence description) {
                    String vehicle = getSelectedVehicle();
                    Cursor managedCursor = _helper.getDescriptionsFor(vehicle, description.toString());
                    Log.d(TAG, "Query has " + managedCursor.getCount() + " rows of description for " + vehicle);
                    return managedCursor;
                }
            });

            _descriptionText.setAdapter(adapter);
        }
```

So, first things first. We setup two arrays. The to\[\] array holds a list of resource id's that will be used to display the text values in the drop down. I just want to display the items in a list, so I used android.R.id.text1. The other array, from\[\] hold the name of the column that will hold the values to display. As I mentioned above, I want to show the values in the description column.

After that we new up a [SimpleCursorAdapter](http://developer.android.com/reference/android/widget/SimpleCursorAdapter.html). The line itself should be pretty obvious. The null that we're passing into the constructor is because we don't yet have a cursor available. In this simple case, the 3rd parameter is android.R.layout.simple_dropdown_item1line will suffice. If we were making our own view for display description, then we'd pass in the resource id of the control that would display the text value.

After instantiating the adapter, we provide some direction as to how we should convert the cursor to a string value that can be displayed. We do this with a [CursorStringConverter](http://developer.android.com/reference/android/widget/SimpleCursorAdapter.CursorToStringConverter.html). All we do here is retrieve the value of the description column in the cursor as a string and return that.

The final part is to use a [FilterQueryProvider](http://developer.android.com/reference/android/widget/FilterQueryProvider.html) to get a Cursor holding the rows and columns we want to display - note that I'm doing this by actually running a query each time. There are probably more efficient ways to do it (and if you have a better way I'd love to hear it). The line \_helper.getDescriptionsFor() will return a cursor holding all the rows from my vehicle_descriptions table for a given vehicle. The user will select the vehicle from my vehicle spinner. I created the method getSelectedVehicle() as a convenience method to return the text that is selected in the spinner.

And of course, the final thing is to provide the adapter to the [AutoCompleteTextView](http://developer.android.com/reference/android/widget/AutoCompleteTextView.html).

For the sake of completeness, here is what getDescriptionsFor() looks like. The \_activity below is a reference to whatever Activity. The code here is should be pretty simple - we just return a managedQuery from the ContentProvider for this application. Note that with our projection we return both the \_id column and the description column. The [SimpleCursorAdapter](http://developer.android.com/reference/android/widget/SimpleCursorAdapter.html) requires the \_id filed be present. Anyway, without further adieu - the code:

```java
        public Cursor getDescriptionsFor(String vehicle, String descriptionFragment) {
            String[] projection = new String[]{VehicleDescriptionsTable._ID, VehicleDescriptionsTable.DESCRIPTION};
            String[] selectionArgs = new String[]{vehicle};

            StringBuffer selection = new StringBuffer(VehicleDescriptionsTable.DESCRIPTION)
                    .append(" LIKE '")
                    .append(descriptionFragment)
                    .append("%' AND ")
                    .append(VehicleDescriptionsTable.VEHICLE)
                    .append("=?");
            String sortOrder = VehicleDescriptionsTable.DESCRIPTION;

            return _activity.managedQuery(VehicleDescriptionsTable.VEHICLE_DESCRIPTION_URI,
                    projection,
                    selection.toString(),
                    selectionArgs, sortOrder);
        }
```

There you have it - [AutoCompleteTextView](http://developer.android.com/reference/android/widget/AutoCompleteTextView.html) and [SimpleCursorAdapter](http://developer.android.com/reference/android/widget/SimpleCursorAdapter.html) together at last.
