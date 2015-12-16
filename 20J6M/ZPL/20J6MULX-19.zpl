set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.5535, <2> 35.1085, <3> 19.5841, <4> 47.7411, <5> 1.4116, <6> 38.2041, <7> 25.3613, <8> 25.1697, <9> 34.0233, <10> 25.0484, <11> 30.9809, <12> 2.1887, <13> 40.8929, <14> 36.8942, <15> 6.7594, <16> 7.1962, <17> 11.7565, <18> 20.0303, <19> 26.1084, <20> 46.1324;
param workload[JOB] := <1> 5.153, <2> 5.9252, <3> 4.4254, <4> 6.9095, <5> 1.1881, <6> 6.1809, <7> 5.036, <8> 5.0169, <9> 5.8329, <10> 5.0048, <11> 5.566, <12> 1.4794, <13> 6.3948, <14> 6.0741, <15> 2.5999, <16> 2.6826, <17> 3.4288, <18> 4.4755, <19> 5.1096, <20> 6.7921;
param capacity[MACHINE] := <1> 15.8793, <2> 15.8793, <3> 15.8793, <4> 15.8793, <5> 15.8793, <6> 15.8793;

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
