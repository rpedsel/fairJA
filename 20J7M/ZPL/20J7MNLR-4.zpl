set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3757, <2> 20.9322, <3> 21.539, <4> 20.4488, <5> 19.0139, <6> 19.9611, <7> 29.6539, <8> 20.4096, <9> 24.9926, <10> 25.7613, <11> 30.4623, <12> 30.9324, <13> 32.2547, <14> 21.6102, <15> 25.517, <16> 25.7042, <17> 29.4829, <18> 25.4635, <19> 26.2413, <20> 26.6011;
param workload[JOB] := <1> 9.9024, <2> 29.5385, <3> 7.1572, <4> 6.1819, <5> 33.2269, <6> 6.9912, <7> 3.7857, <8> 0.1782, <9> 41.0605, <10> 20.262, <11> 27.3352, <12> 6.3548, <13> 2.8502, <14> 21.3931, <15> 39.3406, <16> 14.3583, <17> 25.2455, <18> 1.7125, <19> 32.9889, <20> 16.2249;
param capacity[MACHINE] := <1> 49.4412, <2> 49.4412, <3> 49.4412, <4> 49.4412, <5> 49.4412, <6> 49.4412, <7> 49.4412;

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
