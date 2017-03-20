package ${packageName}.view.impl;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import android.databinding.DataBindingUtil;
import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};
import ${packageName}.injection.${moduleClass};
import ${packageName}.injection.Dagger${componentClass};

import javax.inject.Inject;

public final class ${activityClass} extends BaseFragment implements ${viewClass}
{
    @Inject 
    ${presenterClass} mPresenter;
    @Inject
    ${viewModelClass} m${viewModelClass};
    Fragment${underscoreToCamelCase(classToResource(activityClass))}Binding mBinding;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        mBinding = DataBindingUtil.inflate(inflater, R.layout.${layoutName}, container, false);
        mBinding.setView(this);
        mBinding.setPresenter(mPresenter);
        mBinding.setModel(m${viewModelClass});
        ButterKnife.bind(this, mBinding.getRoot());
        return mBinding.getRoot();
    }

    @Override
    protected void setupComponent(@NonNull AppComponent parentComponent) 
    {
        Dagger${componentClass}.builder().appComponent(parentComponent)
            .${moduleClass?uncap_first}(new ${moduleClass}(this)).build().inject(this);
    }

    @Override
    protected BasePresenter getBasePresenter() 
    {
        return mPresenter;
    }  
}
