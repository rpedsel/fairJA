set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3266, <2> 21.0868, <3> 29.472, <4> 20.0825, <5> 22.9067, <6> 20.8147, <7> 24.8846, <8> 28.061, <9> 22.3211, <10> 19.6442, <11> 20.7312, <12> 16.0139, <13> 28.5769, <14> 22.5278, <15> 32.2251, <16> 27.7006, <17> 21.4899, <18> 19.0523, <19> 26.9324, <20> 26.508;
param workload[JOB] := <1> 29.3266, <2> 21.0868, <3> 29.472, <4> 20.0825, <5> 22.9067, <6> 20.8147, <7> 24.8846, <8> 28.061, <9> 22.3211, <10> 19.6442, <11> 20.7312, <12> 16.0139, <13> 28.5769, <14> 22.5278, <15> 32.2251, <16> 27.7006, <17> 21.4899, <18> 19.0523, <19> 26.9324, <20> 26.508;
param capacity[MACHINE] := <1> 480.3583, <2> 480.3583, <3> 480.3583, <4> 480.3583, <5> 480.3583, <6> 480.3583, <7> 480.3583;

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
