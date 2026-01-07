import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.homekru_owner_dev"
            resValue(type = "string", name = "app_name", value = "Homekru Owner Dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.homekru_owner"
            resValue(type = "string", name = "app_name", value = "Homekru Owner")
        }
    }
}