set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.4419, <2> 41.3697, <3> 5.3097, <4> 2.0614, <5> 18.1546, <6> 7.9477, <7> 4.429, <8> 29.2058, <9> 21.366, <10> 32.3835, <11> 32.2261, <12> 2.1482, <13> 40.0406, <14> 49.2704, <15> 49.0004, <16> 5.6172, <17> 7.0589, <18> 15.4534, <19> 34.9342, <20> 21.9988;
param workload[JOB] := <1> 5.336, <2> 45.472, <3> 1.1287, <4> 28.5681, <5> 12.86, <6> 49.0106, <7> 35.5262, <8> 6.3354, <9> 3.5944, <10> 45.1318, <11> 6.4482, <12> 41.0447, <13> 12.4653, <14> 19.3754, <15> 42.1283, <16> 31.7373, <17> 10.5127, <18> 31.6524, <19> 33.3225, <20> 22.7366;
param capacity[MACHINE] := <1> 51.8986, <2> 51.8986, <3> 51.8986, <4> 51.8986, <5> 51.8986, <6> 51.8986, <7> 51.8986;

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
