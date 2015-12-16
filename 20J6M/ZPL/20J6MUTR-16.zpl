set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.2087, <2> 14.7313, <3> 45.3678, <4> 28.8609, <5> 44.86, <6> 35.6819, <7> 41.9976, <8> 6.4087, <9> 0.0503, <10> 1.7414, <11> 36.3505, <12> 46.0997, <13> 34.4016, <14> 3.7413, <15> 21.7445, <16> 47.8849, <17> 17.4856, <18> 35.3001, <19> 33.3652, <20> 38.8345;
param workload[JOB] := <1> 37.2459, <2> 14.6392, <3> 47.3127, <4> 21.3462, <5> 17.886, <6> 9.5981, <7> 22.0236, <8> 20.2081, <9> 25.0282, <10> 12.3621, <11> 29.2899, <12> 39.1731, <13> 34.6658, <14> 10.7423, <15> 10.7793, <16> 1.0511, <17> 24.008, <18> 41.4794, <19> 44.9028, <20> 29.2755;
param capacity[MACHINE] := <1> 61.6272, <2> 61.6272, <3> 61.6272, <4> 61.6272, <5> 61.6272, <6> 61.6272;

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
