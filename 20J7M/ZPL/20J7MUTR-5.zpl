set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.4516, <2> 7.3995, <3> 21.9944, <4> 9.3285, <5> 3.2159, <6> 45.447, <7> 13.9007, <8> 18.7761, <9> 11.6757, <10> 38.5775, <11> 36.0006, <12> 48.204, <13> 17.2454, <14> 28.232, <15> 11.3705, <16> 40.2223, <17> 14.4894, <18> 40.9541, <19> 5.1962, <20> 49.6465;
param workload[JOB] := <1> 40.9451, <2> 36.3525, <3> 30.7958, <4> 1.6849, <5> 33.2409, <6> 32.3466, <7> 26.2034, <8> 49.4583, <9> 11.2499, <10> 36.7199, <11> 45.7252, <12> 40.3911, <13> 3.0246, <14> 16.0008, <15> 4.8005, <16> 16.8485, <17> 42.1815, <18> 21.8454, <19> 36.3884, <20> 44.7353;
param capacity[MACHINE] := <1> 61.172, <2> 61.172, <3> 61.172, <4> 61.172, <5> 61.172, <6> 61.172, <7> 61.172;

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
