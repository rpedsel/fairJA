set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.457, <2> 29.822, <3> 40.9457, <4> 25.6489, <5> 2.9373, <6> 47.43, <7> 10.0208, <8> 20.5611, <9> 25.3151, <10> 38.2828, <11> 24.6788, <12> 45.5609, <13> 3.9597, <14> 28.9291, <15> 34.3949, <16> 29.4623, <17> 35.4985, <18> 18.0746, <19> 26.8648, <20> 40.4393;
param workload[JOB] := <1> 6.8159, <2> 5.461, <3> 6.3989, <4> 5.0645, <5> 1.7139, <6> 6.8869, <7> 3.1656, <8> 4.5344, <9> 5.0314, <10> 6.1873, <11> 4.9678, <12> 6.7499, <13> 1.9899, <14> 5.3786, <15> 5.8647, <16> 5.4279, <17> 5.9581, <18> 4.2514, <19> 5.1831, <20> 6.3592;
param capacity[MACHINE] := <1> 11.0776, <2> 11.0776, <3> 11.0776, <4> 11.0776, <5> 11.0776, <6> 11.0776, <7> 11.0776;

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
