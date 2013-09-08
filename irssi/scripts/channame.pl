use strict;
use vars qw($VERSION %IRSSI);

use Irssi::TextUI;

$VERSION = "0.1";
%IRSSI = (
		authors => "Christian 'crshd' Brassat",
		contact => "trashbukkit\@gmail.com",
		description => "Display channel name in statusbar with some padding",
		license => "BSD-3",
		url => "http://crshd.github.io"
		);

sub channame {
		my ($sb_item, $get_size_only) = @_;
		my $wi = !Irssi::active_win() ? undef : Irssi::active_win()->{active};
		my $output = sprintf("%13s", $wi->{name});

		$sb_item->default_handler($get_size_only, "{sb $output", '', 0);
}

sub refresh {
		Irssi::statusbar_items_redraw('channame');
}

Irssi::statusbar_item_register('channame', undef, 'channame');
Irssi::statusbars_recreate_items();
Irssi::signal_add('window changed', 'refresh');
Irssi::signal_add('window item changed', 'refresh');
