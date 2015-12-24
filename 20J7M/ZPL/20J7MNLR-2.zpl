set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.168, <2> 30.0535, <3> 23.5091, <4> 25.8431, <5> 26.8942, <6> 35.5121, <7> 23.1756, <8> 20.4121, <9> 27.9766, <10> 21.651, <11> 30.0926, <12> 20.5683, <13> 26.4967, <14> 28.2407, <15> 24.6178, <16> 29.4596, <17> 25.7247, <18> 22.8485, <19> 29.2567, <20> 29.3845;
param workload[JOB] := <1> 38.4515, <2> 0.5682, <3> 32.2301, <4> 9.7772, <5> 2.7608, <6> 45.6312, <7> 47.2366, <8> 39.5133, <9> 40.507, <10> 1.4181, <11> 33.2907, <12> 3.4975, <13> 27.6528, <14> 33.8068, <15> 9.5721, <16> 6.8727, <17> 17.342, <18> 38.6584, <19> 13.1207, <20> 32.7273;
param capacity[MACHINE] := <1> 67.805, <2> 67.805, <3> 67.805, <4> 67.805, <5> 67.805, <6> 67.805, <7> 67.805;

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
