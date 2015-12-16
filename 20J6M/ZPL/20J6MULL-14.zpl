set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.2495, <2> 6.8053, <3> 17.0732, <4> 41.0772, <5> 0.8608, <6> 42.9078, <7> 21.9045, <8> 49.6409, <9> 22.2871, <10> 17.6983, <11> 3.9955, <12> 35.4971, <13> 40.6009, <14> 4.9359, <15> 23.7792, <16> 46.8229, <17> 10.3221, <18> 37.9804, <19> 43.7267, <20> 14.179;
param workload[JOB] := <1> 5.2495, <2> 6.8053, <3> 17.0732, <4> 41.0772, <5> 0.8608, <6> 42.9078, <7> 21.9045, <8> 49.6409, <9> 22.2871, <10> 17.6983, <11> 3.9955, <12> 35.4971, <13> 40.6009, <14> 4.9359, <15> 23.7792, <16> 46.8229, <17> 10.3221, <18> 37.9804, <19> 43.7267, <20> 14.179;
param capacity[MACHINE] := <1> 81.224, <2> 81.224, <3> 81.224, <4> 81.224, <5> 81.224, <6> 81.224;

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
