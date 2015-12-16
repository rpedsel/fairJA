set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1044, <2> 26.605, <3> 15.9309, <4> 21.1192, <5> 33.9837, <6> 21.0478, <7> 27.0572, <8> 19.1198, <9> 35.7947, <10> 33.3644, <11> 18.8842, <12> 21.6944, <13> 19.5478, <14> 24.9953, <15> 25.0875, <16> 19.2898, <17> 20.7336, <18> 15.7344, <19> 28.908, <20> 18.3846;
param workload[JOB] := <1> 30.4695, <2> 17.2569, <3> 31.5294, <4> 4.3495, <5> 49.5065, <6> 41.1407, <7> 4.4187, <8> 11.8989, <9> 0.3815, <10> 24.4163, <11> 48.8224, <12> 40.4557, <13> 10.8471, <14> 48.1955, <15> 25.4857, <16> 8.8577, <17> 12.5289, <18> 45.1595, <19> 29.4796, <20> 16.6827;
param capacity[MACHINE] := <1> 83.6471, <2> 83.6471, <3> 83.6471, <4> 83.6471, <5> 83.6471, <6> 83.6471;

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
