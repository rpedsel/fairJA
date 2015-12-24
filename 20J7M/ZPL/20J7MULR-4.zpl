set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.7526, <2> 39.0885, <3> 9.2233, <4> 42.8992, <5> 6.9786, <6> 19.6461, <7> 21.8107, <8> 11.3089, <9> 28.5434, <10> 30.7254, <11> 29.8022, <12> 17.9306, <13> 39.55, <14> 49.2303, <15> 21.5669, <16> 11.3643, <17> 12.7572, <18> 46.4176, <19> 18.567, <20> 25.286;
param workload[JOB] := <1> 45.8106, <2> 42.4787, <3> 35.6961, <4> 7.823, <5> 42.6918, <6> 43.2236, <7> 35.8843, <8> 22.4507, <9> 15.9185, <10> 5.5732, <11> 20.2832, <12> 23.0348, <13> 6.986, <14> 19.3288, <15> 48.3557, <16> 28.0389, <17> 34.4275, <18> 8.1587, <19> 2.2149, <20> 35.2822;
param capacity[MACHINE] := <1> 74.8087, <2> 74.8087, <3> 74.8087, <4> 74.8087, <5> 74.8087, <6> 74.8087, <7> 74.8087;

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
