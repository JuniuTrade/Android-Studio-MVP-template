package ${packageName}.base;

import android.os.Bundle;
import android.support.annotation.NonNull;

public abstract class BasePresenter {
    /**
     * Should be called by the view when the state of a previous view restores
     *
     * @param savedInstanceState the saved state
     */
    public void onRestoreState(@NonNull Bundle savedInstanceState){}

    /**
     * Should be called by the view every time it starts
     *
     * @param firstStart is it the first start?
     */
    public void onStart(boolean firstStart){}

    /**
     * Should be called by the view every time it stops
     */
    public void onStop(){}

    /**
     * Should be called by the view every time it destroy
     */
    public void onDestroy(){}
    
    /**
     * Should be called by the view before being destroyed to save its current state
     *
     * @param outState bundle to put data into
     */
    public void onSaveInstanceState(@NonNull Bundle outState){}
}
