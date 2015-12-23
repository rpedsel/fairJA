set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8958, <2> 33.1631, <3> 9.2552, <4> 22.8031, <5> 28.2244, <6> 23.1505, <7> 4.3944, <8> 14.7668, <9> 2.0656, <10> 13.381, <11> 0.9993, <12> 47.7062, <13> 34.3343, <14> 10.8805, <15> 48.0662, <16> 44.712, <17> 10.8894, <18> 45.5804, <19> 29.8293, <20> 28.3512;
param workload[JOB] := <1> 3.8595, <2> 5.7587, <3> 3.0422, <4> 4.7753, <5> 5.3127, <6> 4.8115, <7> 2.0963, <8> 3.8428, <9> 1.4372, <10> 3.658, <11> 0.9996, <12> 6.907, <13> 5.8595, <14> 3.2986, <15> 6.933, <16> 6.6867, <17> 3.2999, <18> 6.7513, <19> 5.4616, <20> 5.3246;
param capacity[MACHINE] := <1> 9.6553, <2> 9.6553, <3> 9.6553, <4> 9.6553, <5> 9.6553, <6> 9.6553, <7> 9.6553;

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
