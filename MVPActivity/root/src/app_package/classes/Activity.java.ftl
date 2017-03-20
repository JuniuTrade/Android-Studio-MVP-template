package ${packageName}.view.impl;

import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.NonNull;

import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};
import ${packageName}.injection.${moduleClass};
import ${packageName}.injection.Dagger${componentClass};

import javax.inject.Inject;

public final class ${activityClass} extends BaseActivity implements ${viewClass}
{
    @Inject 
    ${presenterClass} mPresenter;
    @Inject
    ${viewModelClass} m${viewModelClass};
    Activity${underscoreToCamelCase(classToResource(activityClass))}Binding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        mBinding = DataBindingUtil.setContentView(this, R.layout.${layoutName});
        mBinding.setView(this);
        mBinding.setPresenter(mPresenter);
        mBinding.setModel(m${viewModelClass});
        ButterKnife.bind(this);
        //TODO
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
