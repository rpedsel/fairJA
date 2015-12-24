set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6449, <2> 25.4438, <3> 31.85, <4> 32.2431, <5> 33.1717, <6> 24.8191, <7> 26.1696, <8> 18.162, <9> 29.0925, <10> 25.3165, <11> 19.3629, <12> 27.5782, <13> 18.7092, <14> 20.3111, <15> 26.2824, <16> 23.421, <17> 22.115, <18> 21.5739, <19> 24.974, <20> 22.4359;
param workload[JOB] := <1> 5.2578, <2> 5.0442, <3> 5.6436, <4> 5.6783, <5> 5.7595, <6> 4.9819, <7> 5.1156, <8> 4.2617, <9> 5.3937, <10> 5.0316, <11> 4.4003, <12> 5.2515, <13> 4.3254, <14> 4.5068, <15> 5.1266, <16> 4.8395, <17> 4.7027, <18> 4.6448, <19> 4.9974, <20> 4.7367;
param capacity[MACHINE] := <1> 14.2428, <2> 14.2428, <3> 14.2428, <4> 14.2428, <5> 14.2428, <6> 14.2428, <7> 14.2428;

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
