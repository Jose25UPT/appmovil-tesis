package com.example.appsegdispomov

import android.content.pm.PackageManager
import android.net.InetAddresses
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.IOException
import java.net.InetAddress
import java.net.UnknownHostException

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.apppermissions"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getPermissions" -> {
                    val packageName = call.argument<String>("packageName") ?: ""
                    val permissions = getAppPermissions(packageName)
                    result.success(permissions)
                }
                "scanNetwork" -> {
                    val subnet = call.argument<String>("subnet") ?: ""
                    val devices = scanNetwork(subnet)
                    result.success(devices)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getAppPermissions(packageName: String): Map<String, Any> {
        val permissionsMap = mutableMapOf<String, Any>()
        try {
            val packageInfo = packageManager.getPackageInfo(packageName, PackageManager.GET_PERMISSIONS)
            val grantedPermissions = mutableListOf<String>()
            val deniedPermissions = mutableListOf<String>()
            packageInfo.requestedPermissions?.forEach { permission ->
                when {
                    packageManager.checkPermission(permission, packageName) == PackageManager.PERMISSION_GRANTED -> {
                        grantedPermissions.add(permission)
                    }
                    else -> {
                        deniedPermissions.add(permission)
                    }
                }
            }
            permissionsMap["granted"] = grantedPermissions
            permissionsMap["denied"] = deniedPermissions
        } catch (e: PackageManager.NameNotFoundException) {
            permissionsMap["error"] = e.message ?: "Error al obtener permisos"
        }
        return permissionsMap
    }

    private fun scanNetwork(subnet: String): List<String> {
        val devices = mutableListOf<String>()
        try {
            // Aquí asumimos que subnet está en formato "192.168.1."
            for (i in 1..254) {
                val ipAddress = "$subnet$i"
                if (isDeviceOnline(ipAddress)) {
                    devices.add(ipAddress)
                }
            }
        } catch (e: Exception) {
            devices.add("Error: ${e.message}")
        }
        return devices
    }

    private fun isDeviceOnline(ipAddress: String): Boolean {
        return try {
            InetAddress.getByName(ipAddress).isReachable(100) // Timeout de 100ms
        } catch (e: UnknownHostException) {
            false
        } catch (e: IOException) {
            false
        }
    }
}
