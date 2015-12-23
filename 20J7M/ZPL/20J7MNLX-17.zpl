set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.5292, <2> 21.3893, <3> 24.8995, <4> 19.0084, <5> 21.1308, <6> 34.9129, <7> 26.8935, <8> 9.4988, <9> 22.2094, <10> 31.6839, <11> 27.5341, <12> 26.4442, <13> 39.5912, <14> 21.4653, <15> 26.219, <16> 21.6304, <17> 22.7939, <18> 15.7818, <19> 25.518, <20> 17.9387;
param workload[JOB] := <1> 5.1507, <2> 4.6249, <3> 4.9899, <4> 4.3599, <5> 4.5968, <6> 5.9087, <7> 5.1859, <8> 3.082, <9> 4.7127, <10> 5.6288, <11> 5.2473, <12> 5.1424, <13> 6.2922, <14> 4.6331, <15> 5.1204, <16> 4.6508, <17> 4.7743, <18> 3.9726, <19> 5.0515, <20> 4.2354;
param capacity[MACHINE] := <1> 13.9086, <2> 13.9086, <3> 13.9086, <4> 13.9086, <5> 13.9086, <6> 13.9086, <7> 13.9086;

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
