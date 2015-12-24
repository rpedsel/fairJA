set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4605, <2> 33.1221, <3> 34.3866, <4> 42.0841, <5> 14.5997, <6> 23.2532, <7> 44.9891, <8> 28.3243, <9> 49.6245, <10> 13.3992, <11> 44.7137, <12> 37.968, <13> 31.4471, <14> 30.5788, <15> 10.8564, <16> 33.1659, <17> 47.076, <18> 17.7061, <19> 19.3402, <20> 46.7147;
param workload[JOB] := <1> 5.8703, <2> 5.7552, <3> 5.864, <4> 6.4872, <5> 3.821, <6> 4.8222, <7> 6.7074, <8> 5.3221, <9> 7.0445, <10> 3.6605, <11> 6.6868, <12> 6.1618, <13> 5.6078, <14> 5.5298, <15> 3.2949, <16> 5.759, <17> 6.8612, <18> 4.2079, <19> 4.3977, <20> 6.8348;
param capacity[MACHINE] := <1> 11.8603, <2> 11.8603, <3> 11.8603, <4> 11.8603, <5> 11.8603, <6> 11.8603, <7> 11.8603;

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
