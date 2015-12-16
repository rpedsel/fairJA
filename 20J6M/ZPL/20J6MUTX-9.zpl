set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.5751, <2> 41.7525, <3> 14.403, <4> 11.6963, <5> 34.635, <6> 29.6714, <7> 25.6397, <8> 37.0338, <9> 8.8133, <10> 40.8658, <11> 43.8249, <12> 32.6928, <13> 14.3293, <14> 18.795, <15> 32.657, <16> 6.2802, <17> 48.5661, <18> 46.8567, <19> 27.6278, <20> 46.2102;
param workload[JOB] := <1> 3.5461, <2> 6.4616, <3> 3.7951, <4> 3.42, <5> 5.8852, <6> 5.4471, <7> 5.0636, <8> 6.0855, <9> 2.9687, <10> 6.3926, <11> 6.62, <12> 5.7178, <13> 3.7854, <14> 4.3353, <15> 5.7146, <16> 2.506, <17> 6.9689, <18> 6.8452, <19> 5.2562, <20> 6.7978;
param capacity[MACHINE] := <1> 12.9516, <2> 12.9516, <3> 12.9516, <4> 12.9516, <5> 12.9516, <6> 12.9516;

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
