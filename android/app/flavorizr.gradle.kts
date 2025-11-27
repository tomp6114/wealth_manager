import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor")

    productFlavors {
        create("dev") {
            dimension = "flavor"
            applicationId = "com.example.money_manager.dev"
            resValue(type = "string", name = "app_name", value = "Wealth Dev")
        }
        create("prod") {
            dimension = "flavor"
            applicationId = "com.example.money_manager"
            resValue(type = "string", name = "app_name", value = "Wealth Manager")
        }
    }
}