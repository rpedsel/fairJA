set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0658, <2> 28.5513, <3> 16.5548, <4> 22.1129, <5> 35.9164, <6> 27.4618, <7> 24.741, <8> 32.0144, <9> 31.4642, <10> 39.1387, <11> 34.7368, <12> 19.9929, <13> 27.994, <14> 34.5697, <15> 23.0402, <16> 19.2439, <17> 31.6425, <18> 26.0667, <19> 29.8865, <20> 30.4384;
param workload[JOB] := <1> 5.3913, <2> 5.3433, <3> 4.0688, <4> 4.7024, <5> 5.993, <6> 5.2404, <7> 4.974, <8> 5.6581, <9> 5.6093, <10> 6.2561, <11> 5.8938, <12> 4.4713, <13> 5.2909, <14> 5.8796, <15> 4.8, <16> 4.3868, <17> 5.6252, <18> 5.1056, <19> 5.4669, <20> 5.5171;
param capacity[MACHINE] := <1> 105.6739, <2> 105.6739, <3> 105.6739, <4> 105.6739, <5> 105.6739, <6> 105.6739, <7> 105.6739;

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
