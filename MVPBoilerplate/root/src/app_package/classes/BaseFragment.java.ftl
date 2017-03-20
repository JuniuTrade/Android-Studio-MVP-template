package ${packageName}.base;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.widget.Toast;

import ${packageName}.injection.AppComponent;

public abstract class BaseFragment extends Fragment
{
    /**
     * Is this the first start of the fragment (after onCreate)
     */
    private boolean firstStart;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

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
        setupComponent(((${appClass}) getActivity().getApplication()).getAppComponent());
    }

    @Override
    public void onSaveInstanceState(Bundle outState)
    {
        final BasePresenter presenter = getBasePresenter();
        if( presenter != null )
        {
            presenter.onSaveInstanceState(outState);
        }

        super.onSaveInstanceState(outState);
    }

    @Override
    public void onStart()
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
    public void onStop()
    {
        final BasePresenter presenter = getBasePresenter();
        if( presenter != null )
        {
            presenter.onStop();
        }

        super.onStop();
    }

    @Override
    public void onDestroy() {
        final BasePresenter presenter = getBasePresenter();
        if (presenter != null) 
        {
            presenter.onDestroy();
        }

        super.onDestroy();
    }

    public void showToastMessage(int message) {
        Toast.makeText(getContext(),getResources().getText(message),Toast.LENGTH_SHORT).show();
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
