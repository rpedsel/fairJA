set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9302, <2> 19.5532, <3> 31.5995, <4> 19.5879, <5> 31.5686, <6> 20.4794, <7> 22.7437, <8> 23.7983, <9> 17.7129, <10> 26.3053, <11> 24.6467, <12> 33.1321, <13> 23.0428, <14> 18.04, <15> 26.2813, <16> 25.5016, <17> 12.4006, <18> 21.3222, <19> 22.5238, <20> 29.25;
param workload[JOB] := <1> 4.8919, <2> 4.4219, <3> 5.6213, <4> 4.4258, <5> 5.6186, <6> 4.5254, <7> 4.769, <8> 4.8784, <9> 4.2087, <10> 5.1289, <11> 4.9645, <12> 5.756, <13> 4.8003, <14> 4.2474, <15> 5.1265, <16> 5.0499, <17> 3.5214, <18> 4.6176, <19> 4.7459, <20> 5.4083;
param capacity[MACHINE] := <1> 13.8182, <2> 13.8182, <3> 13.8182, <4> 13.8182, <5> 13.8182, <6> 13.8182, <7> 13.8182;

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
