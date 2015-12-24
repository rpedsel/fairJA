set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.1842, <2> 36.5365, <3> 22.7644, <4> 40.3187, <5> 27.6243, <6> 6.8031, <7> 29.5203, <8> 30.623, <9> 11.6231, <10> 45.7967, <11> 11.5932, <12> 14.236, <13> 4.1255, <14> 25.3343, <15> 23.2841, <16> 17.194, <17> 24.5921, <18> 28.732, <19> 32.2354, <20> 13.0961;
param workload[JOB] := <1> 36.1842, <2> 36.5365, <3> 22.7644, <4> 40.3187, <5> 27.6243, <6> 6.8031, <7> 29.5203, <8> 30.623, <9> 11.6231, <10> 45.7967, <11> 11.5932, <12> 14.236, <13> 4.1255, <14> 25.3343, <15> 23.2841, <16> 17.194, <17> 24.5921, <18> 28.732, <19> 32.2354, <20> 13.0961;
param capacity[MACHINE] := <1> 51.6661, <2> 51.6661, <3> 51.6661, <4> 51.6661, <5> 51.6661, <6> 51.6661, <7> 51.6661;

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
