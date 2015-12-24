set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.3086, <2> 21.3908, <3> 7.2521, <4> 39.8865, <5> 10.5, <6> 18.883, <7> 46.6927, <8> 24.1762, <9> 36.2386, <10> 38.8971, <11> 48.4881, <12> 0.5185, <13> 11.1095, <14> 32.3671, <15> 36.2595, <16> 22.3323, <17> 18.197, <18> 21.0028, <19> 18.1047, <20> 33.7435;
param workload[JOB] := <1> 6.7312, <2> 4.625, <3> 2.693, <4> 6.3156, <5> 3.2404, <6> 4.3455, <7> 6.8332, <8> 4.9169, <9> 6.0199, <10> 6.2368, <11> 6.9633, <12> 0.7201, <13> 3.3331, <14> 5.6892, <15> 6.0216, <16> 4.7257, <17> 4.2658, <18> 4.5829, <19> 4.255, <20> 5.8089;
param capacity[MACHINE] := <1> 10.5347, <2> 10.5347, <3> 10.5347, <4> 10.5347, <5> 10.5347, <6> 10.5347, <7> 10.5347;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
