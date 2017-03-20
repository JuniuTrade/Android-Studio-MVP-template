package ${packageName}.base;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.Toast;

import ${packageName}.injection.AppComponent;

public abstract class BaseActivity extends AppCompatActivity
{
    /**
     * Is this the first start of the activity (after onCreate)
     */
    private boolean firstStart;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        ${appClass}.getInstance().addActivity(this);

        firstStart = true;

        injectDependencies();

        if( savedInstanceState != null )
        {
            final BasePresenter presenter = getBasePresenter();
            if( presenter != null )
            {
                presenter.onRestoreState(savedInstanceState);
            }
        }
    }

    private void injectDependencies()
    {
        setupComponent(${appClass}.getInstance().getAppComponent());
    }

    @Override
    protected void onSaveInstanceState(Bundle outState)
    {
        final BasePresenter presenter = getBasePresenter();
        if( presenter != null )
        {
            presenter.onSaveInstanceState(outState);
        }

        super.onSaveInstanceState(outState);
    }

    @Override
    protected void onStart()
    {
        super.onStart();

        final BasePresenter presenter = getBasePresenter();
        if( presenter != null )
        {
            presenter.onStart(firstStart);
        }

        firstStart = false;
    }

    @Override
    protected void onStop()
    {
        final BasePresenter presenter = getBasePresenter();
        if( presenter != null )
        {
            presenter.onStop();
        }

        super.onStop();
    }

    @Override
    protected void onDestroy() {
        final BasePresenter presenter = getBasePresenter();
        if (presenter != null) 
        {
            presenter.onDestroy();
        }

        ${appClass}.getInstance().removeActivity(this);

        super.onDestroy();
    }


    public void showToastMessage(int message) {
        Toast.makeText(this,getResources().getText(message),Toast.LENGTH_SHORT).show();
    }

    /**
     * Get the base presenter for this view
     *
     * @return the base presenter if any, null otherwise
     */
    @Nullable
    protected abstract BasePresenter getBasePresenter();

    /**
     * Setup the injection component for this view
     *
     * @param appComponent the app component
     */
    protected abstract void setupComponent(@NonNull AppComponent appComponent);
}
