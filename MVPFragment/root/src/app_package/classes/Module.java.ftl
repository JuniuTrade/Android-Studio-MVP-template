package ${packageName}.injection;

import android.support.annotation.NonNull;

import ${packageName}.view.${viewClass};
import ${packageName}.interactor.${interactorClass};
import ${packageName}.interactor.impl.${interactorClass}Impl;
import ${packageName}.model.${viewModelClass};
import ${packageName}.presenter.${presenterClass};
import ${packageName}.presenter.impl.${presenterClass}Impl;

import dagger.Module;
import dagger.Provides;

@Module
public final class ${moduleClass} 
{
	private final ${viewClass} mView;
	private final ${viewModelClass} m${viewModelClass};

	public ${moduleClass}(@NonNull ${viewClass} view)
	{
		mView = view;
		m${viewModelClass} = new ${viewModelClass}();
	}

	@Provides
	public ${viewClass} provideView()
	{
		return mView;
	}

	@Provides
	public ${viewModelClass} provideViewModel()
	{
		return m${viewModelClass};
	}

	@Provides
	public ${interactorClass} provideInteractor()
	{
		return new ${interactorClass}Impl();
	}

	@Provides
	public ${presenterClass} providePresenter(${viewClass} view,${interactorClass} interactor,${viewModelClass} ${viewModelClass?uncap_first})
	{
		return new ${presenterClass}Impl(view, interactor,${viewModelClass?uncap_first});
	}
}
