set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.2757, <2> 49.2351, <3> 25.8373, <4> 29.6528, <5> 3.6961, <6> 47.4618, <7> 23.528, <8> 32.0797, <9> 21.7804, <10> 5.4449, <11> 4.9415, <12> 0.2945, <13> 0.7403, <14> 10.5091, <15> 13.4067, <16> 42.7181, <17> 16.6886, <18> 7.1026, <19> 4.4258, <20> 49.9919;
param workload[JOB] := <1> 39.3844, <2> 2424.0951, <3> 667.5661, <4> 879.2885, <5> 13.6612, <6> 2252.6225, <7> 553.5668, <8> 1029.1072, <9> 474.3858, <10> 29.6469, <11> 24.4184, <12> 0.0867, <13> 0.548, <14> 110.4412, <15> 179.7396, <16> 1824.8361, <17> 278.5094, <18> 50.4469, <19> 19.5877, <20> 2499.1901;
param capacity[MACHINE] := <1> 2225.1881, <2> 2225.1881, <3> 2225.1881, <4> 2225.1881, <5> 2225.1881, <6> 2225.1881;

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
