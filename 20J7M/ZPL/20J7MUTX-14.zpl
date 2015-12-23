set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.2863, <2> 10.4517, <3> 26.2151, <4> 40.2366, <5> 34.1338, <6> 20.8673, <7> 41.8273, <8> 6.0238, <9> 15.1622, <10> 2.0962, <11> 44.8638, <12> 48.6517, <13> 18.4447, <14> 45.0433, <15> 16.6304, <16> 17.1004, <17> 31.0973, <18> 47.1842, <19> 43.5824, <20> 20.7046;
param workload[JOB] := <1> 2.8786, <2> 3.2329, <3> 5.1201, <4> 6.3432, <5> 5.8424, <6> 4.5681, <7> 6.4674, <8> 2.4543, <9> 3.8939, <10> 1.4478, <11> 6.698, <12> 6.9751, <13> 4.2947, <14> 6.7114, <15> 4.078, <16> 4.1353, <17> 5.5765, <18> 6.8691, <19> 6.6017, <20> 4.5502;
param capacity[MACHINE] := <1> 10.5791, <2> 10.5791, <3> 10.5791, <4> 10.5791, <5> 10.5791, <6> 10.5791, <7> 10.5791;

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
