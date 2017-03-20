package ${packageName}.base;

import android.app.Activity;
import android.app.Application;
import android.support.annotation.NonNull;

import ${packageName}.injection.AppComponent;
import ${packageName}.injection.AppModule;
import ${packageName}.injection.DaggerAppComponent;

public final class ${appClass} extends Application
{
    private static ${appClass} sInstance;
    private static AppComponent sAppComponent;
    private Set<Activity> mActivities;

    public static synchronized ${appClass} getInstance() {
        return sInstance;
    }

    @Override
    public void onCreate()
    {
        super.onCreate();
        sInstance = this;
        initAppComponent();
    }

    private void initAppComponent() {
        sAppComponent = DaggerAppComponent.builder()
                .appModule(new AppModule(this))
                .build();
    }

    @NonNull
    public AppComponent getAppComponent()
    {
        return sAppComponent;
    }

    public void addActivity(Activity act) {
        if (mActivities == null) {
            mActivities = new HashSet<>();
        }
        mActivities.add(act);
    }

    public void removeActivity(Activity act) {
        if (mActivities != null) {
            mActivities.remove(act);
        }
    }

    public void exitApp() {
        if (mActivities != null) {
            synchronized (mActivities) {
                for (Activity act : mActivities) {
                    act.finish();
                }
            }
        }
        android.os.Process.killProcess(android.os.Process.myPid());
        System.exit(0);
    }
}