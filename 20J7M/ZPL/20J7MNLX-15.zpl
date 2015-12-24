set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2068, <2> 25.3588, <3> 23.8838, <4> 28.504, <5> 18.966, <6> 29.2557, <7> 27.2706, <8> 20.8312, <9> 25.4734, <10> 30.6758, <11> 27.4859, <12> 16.3844, <13> 27.4653, <14> 25.9976, <15> 18.2213, <16> 19.9055, <17> 20.3809, <18> 27.1741, <19> 27.8492, <20> 25.3121;
param workload[JOB] := <1> 4.6051, <2> 5.0358, <3> 4.8871, <4> 5.3389, <5> 4.355, <6> 5.4089, <7> 5.2221, <8> 4.5641, <9> 5.0471, <10> 5.5386, <11> 5.2427, <12> 4.0478, <13> 5.2407, <14> 5.0988, <15> 4.2686, <16> 4.4616, <17> 4.5145, <18> 5.2129, <19> 5.2772, <20> 5.0311;
param capacity[MACHINE] := <1> 14.0569, <2> 14.0569, <3> 14.0569, <4> 14.0569, <5> 14.0569, <6> 14.0569, <7> 14.0569;

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
