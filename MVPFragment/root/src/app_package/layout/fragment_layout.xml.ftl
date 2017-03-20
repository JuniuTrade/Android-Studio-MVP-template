<?xml version="1.0" encoding="utf-8"?>

<layout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:bind="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">

    <data>

        <import type="android.view.View"/>

        <variable
            name="view"
            type="${packageName}.view.${viewClass}"/>

        <variable
            name="presenter"
            type="${packageName}.presenter.${presenterClass}"/>

        <variable
            name="model"
            type="${packageName}.model.${viewModelClass}"/>
    </data>

	<FrameLayout
	    android:layout_width="match_parent"
	    android:layout_height="match_parent">

	</FrameLayout>

</layout>
