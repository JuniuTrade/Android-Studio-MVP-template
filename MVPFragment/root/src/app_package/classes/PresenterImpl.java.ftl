package ${packageName}.presenter.impl;

import android.os.Bundle;

import ${packageName}.presenter.${presenterClass};
import ${packageName}.view.${viewClass};
import ${packageName}.interactor.${interactorClass};

import javax.inject.Inject;

public final class ${presenterClass}Impl extends ${presenterClass}
{
    private final ${viewClass} mView;
    private final ${interactorClass} mInteractor;
    private final ${viewModelClass} m${viewModelClass};

    @Inject
    public ${presenterClass}Impl(${viewClass} view,${interactorClass} interactor,${viewModelClass} ${viewModelClass?uncap_first})
    {
        mView = view;
        mInteractor = interactor;
        m${viewModelClass} = ${viewModelClass?uncap_first};
    }

    @Override
    public void onStart(boolean firstStart)
    {

    }
}