set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.2243, <2> 0.2502, <3> 16.2334, <4> 18.2174, <5> 2.4334, <6> 7.0851, <7> 21.3246, <8> 14.9869, <9> 25.5513, <10> 1.2268, <11> 6.9653, <12> 25.862, <13> 40.3295, <14> 39.1952, <15> 34.2952, <16> 39.6281, <17> 33.4266, <18> 8.5386, <19> 18.1982, <20> 40.4457;
param workload[JOB] := <1> 7.2243, <2> 0.2502, <3> 16.2334, <4> 18.2174, <5> 2.4334, <6> 7.0851, <7> 21.3246, <8> 14.9869, <9> 25.5513, <10> 1.2268, <11> 6.9653, <12> 25.862, <13> 40.3295, <14> 39.1952, <15> 34.2952, <16> 39.6281, <17> 33.4266, <18> 8.5386, <19> 18.1982, <20> 40.4457;
param capacity[MACHINE] := <1> 401.4178, <2> 401.4178, <3> 401.4178, <4> 401.4178, <5> 401.4178, <6> 401.4178, <7> 401.4178;

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
