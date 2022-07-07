package com.brasizza.marcus.dimep_sat;

import androidx.annotation.NonNull;

import br.com.dimep.dimepsat.DimepSATMainActivity;
import br.com.dimep.dimepsat.driver.USBService;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import br.com.dimep.dimepsat.DimepDSAT;
import androidx.appcompat.app.AppCompatActivity;


import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;


/** DimepSatPlugin */
public class DimepSatPlugin implements FlutterPlugin, MethodCallHandler , ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private DimepDSAT dimepDSAT;
  private Activity activity;
  private Context context;
  private USBService usbService;
  private BinaryMessenger binaryMessenger;



  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    this.binaryMessenger = flutterPluginBinding.getBinaryMessenger();
    this.context = flutterPluginBinding.getApplicationContext();
    context.startService(new Intent(context, USBService.class));
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    Integer numeroSessao = 0;
    String codAtivacao = "";
    Log.d("sat", call.method);
    switch (call.method) {
      default:
        result.notImplemented();
        break;
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;

      case "consultarSat":
         numeroSessao = call.argument("numeroSessao");
        if(numeroSessao == null){
          numeroSessao = UtilidadesGerais.gerarNumeroSessao();
      }
        Log.d("SnumeroSessao",numeroSessao.toString());
        String consultarSat = dimepDSAT.ConsultarSAT(numeroSessao);
        result.success(consultarSat);
        break;

      case "consultarStatus":
        numeroSessao = call.argument("numeroSessao");
        codAtivacao = call.argument("codigoAtivacao");
        if(numeroSessao == null){
          numeroSessao = UtilidadesGerais.gerarNumeroSessao();
        }
        Log.d("SnumeroSessao",numeroSessao.toString());
        String consultarStatusSat = dimepDSAT.ConsultarStatusOperacional(numeroSessao,codAtivacao);
        result.success(consultarStatusSat);
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }


  @Override
public void onAttachedToActivity(ActivityPluginBinding binding) {
    Log.d("onAttachedToActivity" , "onAttachedToActivity" );
    activity = binding.getActivity();
  
    Log.d("onAttachedToActivity" , "abrindo serial" );
    dimepDSAT = new DimepDSAT();
    channel  = new MethodChannel(this.binaryMessenger, "dimep_sat");
    channel.setMethodCallHandler(this);


  }




  @Override
public void  onDetachedFromActivity(){

}

@Override
public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
  onAttachedToActivity(binding);
}

@Override
public void onDetachedFromActivityForConfigChanges(){}
}
