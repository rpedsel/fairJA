set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.3901, <2> 25.2696, <3> 47.477, <4> 29.6091, <5> 23.8704, <6> 27.6538, <7> 35.5652, <8> 34.7372, <9> 49.7663, <10> 37.1414, <11> 42.6763, <12> 13.435, <13> 38.6465, <14> 35.7272, <15> 14.6534, <16> 33.1722, <17> 22.733, <18> 29.4284, <19> 28.2128, <20> 3.6267;
param workload[JOB] := <1> 28.5266, <2> 5.1742, <3> 24.9542, <4> 25.4819, <5> 39.0656, <6> 36.5255, <7> 46.7888, <8> 48.6671, <9> 13.4844, <10> 19.4913, <11> 30.8796, <12> 2.4598, <13> 2.9539, <14> 43.0962, <15> 37.5345, <16> 13.4065, <17> 23.5889, <18> 15.4347, <19> 14.1718, <20> 28.5454;
param capacity[MACHINE] := <1> 500.2309, <2> 500.2309, <3> 500.2309, <4> 500.2309, <5> 500.2309, <6> 500.2309, <7> 500.2309;

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
