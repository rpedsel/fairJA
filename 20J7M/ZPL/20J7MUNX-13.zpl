set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.2005, <2> 47.4864, <3> 8.4986, <4> 10.2117, <5> 31.2594, <6> 38.9446, <7> 7.646, <8> 16.2901, <9> 45.5714, <10> 2.0482, <11> 30.6723, <12> 42.745, <13> 18.5713, <14> 48.4581, <15> 20.153, <16> 47.7474, <17> 15.7041, <18> 2.9386, <19> 27.5998, <20> 4.3798;
param workload[JOB] := <1> 6.7971, <2> 6.891, <3> 2.9152, <4> 3.1956, <5> 5.591, <6> 6.2406, <7> 2.7651, <8> 4.0361, <9> 6.7507, <10> 1.4312, <11> 5.5383, <12> 6.538, <13> 4.3094, <14> 6.9612, <15> 4.4892, <16> 6.9099, <17> 3.9628, <18> 1.7142, <19> 5.2536, <20> 2.0928;
param capacity[MACHINE] := <1> 94.383, <2> 94.383, <3> 94.383, <4> 94.383, <5> 94.383, <6> 94.383, <7> 94.383;

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
