set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.2744, <2> 36.7877, <3> 0.6997, <4> 20.9717, <5> 14.682, <6> 8.1389, <7> 9.8028, <8> 11.2731, <9> 13.4935, <10> 28.9682, <11> 41.8572, <12> 49.5177, <13> 1.2586, <14> 0.1302, <15> 31.6993, <16> 42.5803, <17> 27.5973, <18> 15.8625, <19> 2.59, <20> 47.5819;
param workload[JOB] := <1> 5.7684, <2> 6.0653, <3> 0.8365, <4> 4.5795, <5> 3.8317, <6> 2.8529, <7> 3.1309, <8> 3.3575, <9> 3.6733, <10> 5.3822, <11> 6.4697, <12> 7.0369, <13> 1.1219, <14> 0.3608, <15> 5.6302, <16> 6.5254, <17> 5.2533, <18> 3.9828, <19> 1.6093, <20> 6.898;
param capacity[MACHINE] := <1> 9.0393, <2> 9.0393, <3> 9.0393, <4> 9.0393, <5> 9.0393, <6> 9.0393, <7> 9.0393;

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
