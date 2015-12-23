set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2164, <2> 3.911, <3> 48.9632, <4> 9.8386, <5> 23.1822, <6> 48.0855, <7> 48.2974, <8> 26.4935, <9> 31.3612, <10> 5.3943, <11> 31.4257, <12> 3.032, <13> 29.1491, <14> 26.5681, <15> 9.0814, <16> 40.8058, <17> 40.1691, <18> 46.2694, <19> 13.0922, <20> 16.4284;
param workload[JOB] := <1> 6.2623, <2> 1.9776, <3> 6.9974, <4> 3.1367, <5> 4.8148, <6> 6.9344, <7> 6.9496, <8> 5.1472, <9> 5.6001, <10> 2.3226, <11> 5.6059, <12> 1.7413, <13> 5.399, <14> 5.1544, <15> 3.0135, <16> 6.3879, <17> 6.3379, <18> 6.8022, <19> 3.6183, <20> 4.0532;
param capacity[MACHINE] := <1> 14.0366, <2> 14.0366, <3> 14.0366, <4> 14.0366, <5> 14.0366, <6> 14.0366, <7> 14.0366;

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
