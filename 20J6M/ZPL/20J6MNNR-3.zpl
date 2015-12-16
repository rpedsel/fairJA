set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7978, <2> 29.4626, <3> 20.5595, <4> 20.6715, <5> 27.2813, <6> 28.7181, <7> 23.9793, <8> 18.7881, <9> 30.2568, <10> 19.697, <11> 25.0893, <12> 27.8094, <13> 32.2375, <14> 17.8083, <15> 19.0011, <16> 28.9745, <17> 27.8035, <18> 29.5987, <19> 21.5823, <20> 25.5091;
param workload[JOB] := <1> 2.7039, <2> 49.8561, <3> 31.1195, <4> 27.932, <5> 45.8456, <6> 25.8342, <7> 30.5607, <8> 43.4424, <9> 44.9456, <10> 35.9454, <11> 46.5776, <12> 27.4421, <13> 37.0678, <14> 33.6389, <15> 43.0495, <16> 11.786, <17> 31.6076, <18> 2.2181, <19> 20.844, <20> 15.7706;
param capacity[MACHINE] := <1> 608.1876, <2> 608.1876, <3> 608.1876, <4> 608.1876, <5> 608.1876, <6> 608.1876;

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
