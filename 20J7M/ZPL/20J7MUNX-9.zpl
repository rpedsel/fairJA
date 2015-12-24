set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6245, <2> 28.5157, <3> 38.1323, <4> 3.4936, <5> 45.0311, <6> 19.0298, <7> 5.6455, <8> 47.9705, <9> 43.5893, <10> 25.4577, <11> 34.0068, <12> 31.6509, <13> 3.7616, <14> 3.8198, <15> 12.0658, <16> 43.2125, <17> 8.77, <18> 14.2606, <19> 46.8459, <20> 42.0072;
param workload[JOB] := <1> 4.3156, <2> 5.34, <3> 6.1751, <4> 1.8691, <5> 6.7105, <6> 4.3623, <7> 2.376, <8> 6.9261, <9> 6.6022, <10> 5.0456, <11> 5.8315, <12> 5.6259, <13> 1.9395, <14> 1.9544, <15> 3.4736, <16> 6.5736, <17> 2.9614, <18> 3.7763, <19> 6.8444, <20> 6.4813;
param capacity[MACHINE] := <1> 95.1844, <2> 95.1844, <3> 95.1844, <4> 95.1844, <5> 95.1844, <6> 95.1844, <7> 95.1844;

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
