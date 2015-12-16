set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1672, <2> 32.076, <3> 29.9034, <4> 32.6979, <5> 26.9894, <6> 26.7587, <7> 21.9984, <8> 34.4635, <9> 22.3222, <10> 29.4346, <11> 29.4202, <12> 15.0718, <13> 21.5627, <14> 21.5422, <15> 29.2201, <16> 24.8389, <17> 31.2106, <18> 24.9599, <19> 28.7092, <20> 28.3434;
param workload[JOB] := <1> 20.6245, <2> 7.9566, <3> 17.0021, <4> 32.0354, <5> 6.7952, <6> 35.3455, <7> 34.6487, <8> 12.2601, <9> 37.8014, <10> 31.6104, <11> 18.4474, <12> 7.8533, <13> 45.1887, <14> 16.7807, <15> 25.9164, <16> 7.7813, <17> 33.9414, <18> 25.0893, <19> 10.6863, <20> 25.9435;
param capacity[MACHINE] := <1> 75.618, <2> 75.618, <3> 75.618, <4> 75.618, <5> 75.618, <6> 75.618;

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
