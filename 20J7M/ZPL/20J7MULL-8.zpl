set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.1428, <2> 8.4286, <3> 23.564, <4> 45.8489, <5> 26.5159, <6> 2.2195, <7> 29.1754, <8> 38.1323, <9> 13.4068, <10> 32.9155, <11> 44.1909, <12> 30.3573, <13> 28.2603, <14> 23.6629, <15> 11.052, <16> 39.5883, <17> 19.6832, <18> 18.0936, <19> 19.3122, <20> 43.4936;
param workload[JOB] := <1> 9.1428, <2> 8.4286, <3> 23.564, <4> 45.8489, <5> 26.5159, <6> 2.2195, <7> 29.1754, <8> 38.1323, <9> 13.4068, <10> 32.9155, <11> 44.1909, <12> 30.3573, <13> 28.2603, <14> 23.6629, <15> 11.052, <16> 39.5883, <17> 19.6832, <18> 18.0936, <19> 19.3122, <20> 43.4936;
param capacity[MACHINE] := <1> 72.4349, <2> 72.4349, <3> 72.4349, <4> 72.4349, <5> 72.4349, <6> 72.4349, <7> 72.4349;

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
