set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.9705, <2> 32.6332, <3> 14.5529, <4> 12.3659, <5> 47.0874, <6> 35.4511, <7> 11.4366, <8> 8.996, <9> 18.2426, <10> 45.1101, <11> 47.3066, <12> 41.3137, <13> 36.2808, <14> 26.0807, <15> 20.322, <16> 0.9321, <17> 14.1792, <18> 47.5237, <19> 44.333, <20> 14.3038;
param workload[JOB] := <1> 47.2869, <2> 37.0747, <3> 30.6163, <4> 27.1592, <5> 24.7694, <6> 17.0877, <7> 37.4747, <8> 30.8402, <9> 49.0725, <10> 22.246, <11> 3.8672, <12> 6.3129, <13> 21.4781, <14> 0.9188, <15> 11.1006, <16> 21.6285, <17> 0.5641, <18> 48.5909, <19> 15.6596, <20> 38.8057;
param capacity[MACHINE] := <1> 82.0923, <2> 82.0923, <3> 82.0923, <4> 82.0923, <5> 82.0923, <6> 82.0923;

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
