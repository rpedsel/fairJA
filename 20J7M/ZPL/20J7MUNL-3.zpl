set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5859, <2> 48.0586, <3> 3.3247, <4> 41.3286, <5> 5.1904, <6> 20.7162, <7> 29.7928, <8> 8.5467, <9> 38.1474, <10> 9.173, <11> 31.7286, <12> 4.8848, <13> 35.2103, <14> 11.4743, <15> 13.6588, <16> 16.351, <17> 31.9947, <18> 48.625, <19> 1.489, <20> 37.4902;
param workload[JOB] := <1> 44.5859, <2> 48.0586, <3> 3.3247, <4> 41.3286, <5> 5.1904, <6> 20.7162, <7> 29.7928, <8> 8.5467, <9> 38.1474, <10> 9.173, <11> 31.7286, <12> 4.8848, <13> 35.2103, <14> 11.4743, <15> 13.6588, <16> 16.351, <17> 31.9947, <18> 48.625, <19> 1.489, <20> 37.4902;
param capacity[MACHINE] := <1> 481.771, <2> 481.771, <3> 481.771, <4> 481.771, <5> 481.771, <6> 481.771, <7> 481.771;

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
