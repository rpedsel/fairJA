set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.507, <2> 23.5675, <3> 9.9561, <4> 41.4293, <5> 43.9379, <6> 9.8925, <7> 46.1488, <8> 49.4091, <9> 16.9851, <10> 20.2963, <11> 11.0412, <12> 35.9064, <13> 2.3145, <14> 43.4135, <15> 20.3339, <16> 24.4782, <17> 17.4025, <18> 17.8773, <19> 37.427, <20> 41.849;
param workload[JOB] := <1> 17.6219, <2> 31.9287, <3> 42.4211, <4> 13.0967, <5> 41.5513, <6> 26.6395, <7> 0.7885, <8> 21.3824, <9> 33.9672, <10> 45.8902, <11> 26.2144, <12> 27.4109, <13> 11.7638, <14> 31.1564, <15> 1.4104, <16> 49.4254, <17> 27.2199, <18> 6.0939, <19> 1.084, <20> 25.5411;
param capacity[MACHINE] := <1> 51.708, <2> 51.708, <3> 51.708, <4> 51.708, <5> 51.708, <6> 51.708, <7> 51.708;

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
