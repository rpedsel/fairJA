set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2623, <2> 12.9512, <3> 10.7171, <4> 0.6524, <5> 21.0221, <6> 19.0265, <7> 19.0343, <8> 0.3192, <9> 41.0047, <10> 6.891, <11> 18.2344, <12> 25.3226, <13> 16.7215, <14> 7.4806, <15> 30.0804, <16> 47.6246, <17> 3.8626, <18> 1.5748, <19> 18.5348, <20> 6.1288;
param workload[JOB] := <1> 25.2623, <2> 12.9512, <3> 10.7171, <4> 0.6524, <5> 21.0221, <6> 19.0265, <7> 19.0343, <8> 0.3192, <9> 41.0047, <10> 6.891, <11> 18.2344, <12> 25.3226, <13> 16.7215, <14> 7.4806, <15> 30.0804, <16> 47.6246, <17> 3.8626, <18> 1.5748, <19> 18.5348, <20> 6.1288;
param capacity[MACHINE] := <1> 41.5557, <2> 41.5557, <3> 41.5557, <4> 41.5557, <5> 41.5557, <6> 41.5557;

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
