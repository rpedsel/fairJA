set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.8863, <2> 6.7371, <3> 21.0844, <4> 21.6249, <5> 46.8127, <6> 34.5931, <7> 34.6558, <8> 46.4932, <9> 45.3966, <10> 23.4369, <11> 43.812, <12> 32.2844, <13> 31.5616, <14> 22.9818, <15> 20.0384, <16> 42.6109, <17> 5.0048, <18> 5.0567, <19> 14.1777, <20> 29.0331;
param workload[JOB] := <1> 1.6989, <2> 2.5956, <3> 4.5918, <4> 4.6503, <5> 6.842, <6> 5.8816, <7> 5.8869, <8> 6.8186, <9> 6.7377, <10> 4.8412, <11> 6.6191, <12> 5.6819, <13> 5.618, <14> 4.7939, <15> 4.4764, <16> 6.5277, <17> 2.2371, <18> 2.2487, <19> 3.7653, <20> 5.3882;
param capacity[MACHINE] := <1> 13.9858, <2> 13.9858, <3> 13.9858, <4> 13.9858, <5> 13.9858, <6> 13.9858, <7> 13.9858;

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
