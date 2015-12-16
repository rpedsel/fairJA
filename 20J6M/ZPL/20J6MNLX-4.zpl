set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8294, <2> 32.2818, <3> 26.0704, <4> 16.5703, <5> 19.6966, <6> 22.8816, <7> 21.1797, <8> 29.4069, <9> 20.526, <10> 21.4569, <11> 19.4284, <12> 32.127, <13> 18.1734, <14> 25.792, <15> 26.5071, <16> 26.4133, <17> 29.9483, <18> 27.4852, <19> 24.7322, <20> 27.3684;
param workload[JOB] := <1> 4.9829, <2> 5.6817, <3> 5.1059, <4> 4.0707, <5> 4.4381, <6> 4.7835, <7> 4.6021, <8> 5.4228, <9> 4.5306, <10> 4.6322, <11> 4.4078, <12> 5.6681, <13> 4.263, <14> 5.0786, <15> 5.1485, <16> 5.1394, <17> 5.4725, <18> 5.2426, <19> 4.9731, <20> 5.2315;
param capacity[MACHINE] := <1> 16.4793, <2> 16.4793, <3> 16.4793, <4> 16.4793, <5> 16.4793, <6> 16.4793;

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
